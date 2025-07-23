const request = require('supertest');
const express = require('express');
const app = express();
app.use(express.static('public'));

describe('Basic Server Test', () => {
  test('should serve index.html', async () => {
    const response = await request(app).get('/');
    expect(response.status).toBe(200);
    expect(response.text).toContain('8bytes Application');
  });
});
