ExtractTextPlugin = require 'extract-text-webpack-plugin'
webpack = require 'webpack'

fontName = 'fonts/[name].[ext]'
imageName = 'images/[name].[ext]'

module.exports =
  entry:
    vendor: [
      'webpack-dev-server/client?http://0.0.0.0:8080'
      'webpack/hot/dev-server'
      'react'
    ]
    main: './example/main.jsx'
    style: './example/main.css'
  output:
    path: 'build/'
    filename: '[name].js'
    publicPath: 'http://localhost:8080/build/'
  resolve:
    extensions: ['.coffee', '.js', '.jsx', '']
  module:
    loaders: [
      {
        test: /\.coffee$/
        loader: 'coffee'
      }
      {
        test: /\.js$/
        exclude: /node_modules/
        loader: 'babel'
      }
      {
        test: /\.jsx$/
        exclude: /node_modules/
        loader: 'babel'
      }
      {
        test: /\.css$/
        loader: ExtractTextPlugin.extract 'style', 'css?importLoaders=1!autoprefixer?{browsers:["> 1%"]}'
      }
      {
        test: /\.less$/
        loader: ExtractTextPlugin.extract 'style', 'css?importLoaders=1!autoprefixer?{browsers:["> 1%"]}!less'
      }
      {
        test: /\.(png|jpg|gif)$/
        loader: 'url'
        query:
          limit: 2048
          name: imageName
      }
      {
        test: /\.eot((\?|\#)[\?\#\w\d_-]+)?$/
        loader: 'url'
        query:
          limit: 100
          name: fontName
      }
      {
        test: /\.svg((\?|\#)[\?\#\w\d_-]+)?$/
        loader: 'url'
        query:
          limit: 10000
          minetype: 'image/svg+xml'
          name: fontName
      }
      {
        test: /\.ttf((\?|\#)[\?\#\w\d_-]+)?$/
        loader: 'url'
        query:
          limit: 100
          minetype: 'application/octet-stream'
          name: fontName
      }
      {
        test: /\.woff((\?|\#)[\?\#\w\d_-]+)?$/
        loader: 'url'
        query:
          limit: 100
          minetype: 'application/font-woff'
          name: fontName
      }
      {
        test: /\.woff2((\?|\#)[\?\#\w\d_-]+)?$/
        loader: 'url'
        query:
          limit: 100
          minetype: 'application/font-woff2'
          name: fontName
      }
    ]
  plugins: [
    new webpack.optimize.CommonsChunkPlugin 'vendor', 'vendor.js'
    new ExtractTextPlugin 'style.css'
  ]
