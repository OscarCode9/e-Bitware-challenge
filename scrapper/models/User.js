import mongoose from "mongoose";

const userSchema = new mongoose.Schema(
  {
    user_id: {
      type: Number,
      required: [true, "User ID is required"],
      unique: true,
    },
    first_name: {
      type: String,
      required: [true, "First name is required"],
      trim: true,
    },
    last_name: {
      type: String,
      required: [true, "Last name is required"],
      trim: true,
    },
    email: {
      type: String,
      required: [true, "Email is required"],
      unique: true,
      trim: true,
      lowercase: true,
      validate: {
        validator: function (v) {
          return /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/.test(v);
        },
        message: (props) => `${props.value} is not a valid email!`,
      },
    },
    username: {
      type: String,
      required: [true, "Username is required"],
      unique: true,
      trim: true,
    },
    age: {
      type: Number,
      required: [true, "Age is required"],
      min: [0, "Age cannot be negative"],
      max: [150, "Age cannot be greater than 150"],
    },
    signup_date: {
      type: Date,
      required: [true, "Signup date is required"],
      validate: {
        validator: function (v) {
          return v instanceof Date && !isNaN(v);
        },
        message: (props) => `${props.value} is not a valid date!`,
      },
    },
    is_active: {
      type: Boolean,
      required: true,
      default: true,
    },
  },
  {
    timestamps: true, // Adds createdAt and updatedAt fields
  }
);

userSchema.index({ email: 1 });
userSchema.index({ username: 1 });

export const User = mongoose.model("User", userSchema);
