import { createReadStream } from 'fs';
import Papa from 'papaparse';
import { User } from '../models/User.js';
import { ProcessingError, ValidationError } from '../utils/errors.js';

export class CSVProcessor {
  async processFile(filePath) {
    return new Promise((resolve, reject) => {
      const results = [];
      let lineNumber = 0;

      const fileStream = createReadStream(filePath, 'utf-8');

      Papa.parse(fileStream, {
        header: true,
        dynamicTyping: true, // Convierte automáticamente tipos de datos
        skipEmptyLines: true,
        transformHeader: (header) => header.trim(),
        step: async ({ data, errors }, parser) => {
          lineNumber++;
          
          try {
            if (errors.length > 0) {
              throw new Error(errors[0].message);
            }

            // Transformar y validar los datos
            const userData = {
              ...data,
              signup_date: new Date(data.signup_date),
              is_active: String(data.is_active).toLowerCase() === 'true'
            };

            const user = new User(userData);
            await user.validate();
            results.push(user);

          } catch (error) {
            parser.abort();
            reject(new ProcessingError(error.message, lineNumber));
          }
        },
        complete: async () => {
          try {
            if (results.length > 0) {
              await this.saveToDatabase(results);
            }
            resolve(results);
          } catch (error) {
            reject(error);
          }
        },
        error: (error) => {
          reject(new ProcessingError(`CSV Parsing error: ${error.message}`, lineNumber));
        }
      });
    });
  }

  async saveToDatabase(users) {
    try {
      const result = await User.insertMany(users, { 
        ordered: false,
        rawResult: true
      });
      return result;
    } catch (error) {
      if (error.code === 11000) {
        throw new ValidationError(
          `Duplicate key error: ${JSON.stringify(error.keyValue)}`
        );
      }
      throw error;
    }
  }
}