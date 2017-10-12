Dir[File.join(".", "config/initializers/**/*.rb")].each { |file| require file }
