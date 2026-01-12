function fn() {
  var env = karate.env;
  if (!env) {
    env = 'dev';
  }

  var config = {
    baseUrl: 'https://bookstore.toolsqa.com'
  };

  var Faker = Java.type('com.github.javafaker.Faker');
  config.faker = new Faker();

  karate.configure('connectTimeout', 60000);
  karate.configure('readTimeout', 60000);

  return config;
}