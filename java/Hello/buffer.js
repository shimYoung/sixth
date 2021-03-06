/**
 * http://usejsdoc.org/
 */

var buffer = new ArrayBuffer(16);
var int32View = new Int32Array(buffer);

for(var i=0; i<int32View.length; i++){
	int32View[i] = i * 2;
}

var int16View = new Int16Array(buffer);

console.log(int16View);
console.log(buffer);

for(var i=0; i<int16View.length; i++){
	console.log(int16View[i]);
}

const arr = new Uint16Array(2);

arr[0] = 5000;
arr[1] = 4000;

// Shares memory with `arr`.
const buf = Buffer.from(arr.buffer);

console.log(buf);
console.dir(buf);