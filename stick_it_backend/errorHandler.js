class ErrorHandler extends Error {

    constructor(name,description,httpCode, isOperational) {
        super(description);
        this.name = name
        this.httpCode = httpCode;
        this.isOperational = isOperational;

        // Ensure the proper prototype chain is maintained
        Object.setPrototypeOf(this, new.target.prototype);

        // Capture the stack trace
        Error.captureStackTrace(this);
    }

    getHttpCode() {
        return this.httpCode;
    }
    getDescription() {
        return this.description;
    }
}
module.exports = ErrorHandler;

//401 - email already used 