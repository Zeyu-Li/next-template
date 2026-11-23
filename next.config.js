const path = require("path");

/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  // prepends the shared variables and mixins (ie shared colours) to every stylesheet
  sassOptions: {
    loadPaths: [path.join(__dirname, "styles")],
    additionalData: `@use "shared" as *;`,
  },
};

module.exports = nextConfig;
