import { connectDB } from "./config/database.js";
import { CSVProcessor } from "./services/csvProcessor.js";
import path from "path";
import mongoose from "mongoose";
import { User } from "./models/User.js";

async function main() {
  try {
    await connectDB();
    await User.deleteMany({});
    console.log("All data from the 'User' collection has been deleted.");
    const processor = new CSVProcessor();
    const csvPath = path.resolve("./scrapper/users.csv");
    const results = await processor.processFile(csvPath);

    console.log(`Successfully processed ${results.length} records`);

    const dbResults = await User.find({});
    dbResults.forEach((record) => {
      console.log(record);
    });

    // Cerrar la conexión de mongoose al terminar
    await mongoose.connection.close();
  } catch (error) {
    console.error("Error type:", error.name);
    console.error("Error message:", error.message);

    if (error.name === "ValidationError" || error.name === "ProcessingError") {
      console.error("Validation error:", error.message);
    } else {
      console.error("Application error:", error);
    }

    await mongoose.connection.close();
    process.exit(1);
  }
}

main();
