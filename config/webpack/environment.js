const { environment } = require('@rails/webpacker')
const webpack = require("webpack");
envronment.plugins.append(
    "Provide",
    new webpack.ProvidePlugin({
        $: "jquery",
        jQuery: "jquery",
        Popper: ["popper.js", "defult"]
    })
);
module.exports = environment