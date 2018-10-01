const uuid = require('uuid');
console.log(JSON.stringify({
  uuid_v1: uuid.v1(),
  uuid_v4: uuid.v4(),
}));