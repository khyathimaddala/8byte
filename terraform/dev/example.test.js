const request = require('supertest');
const express = require('express');
const app = express();
app.use(express.static('public'));

describe('Basic Server Test', () => {
  test('should serve public/index.html', async () => {
    const response = await request(app).get('/');
    expect(response.status).toBe(200);
    expect(response.text).toContain('Hey, Hi 8byte - This is Khyathi Maddala'); // Updated expectation
  });
});