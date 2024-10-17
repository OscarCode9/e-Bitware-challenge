export class ValidationError extends Error {
  constructor(message) {
    super(message);
    this.name = 'ValidationError';
  }
}

export class ProcessingError extends Error {
  constructor(message, line) {
    super(`Error processing line ${line}: ${message}`);
    this.name = 'ProcessingError';
    this.line = line;
  }
}