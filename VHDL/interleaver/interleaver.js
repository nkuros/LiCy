var array = [
				[[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], 
				 [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], 
				 [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], 
				 [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], 
				 [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]],
				 
				[[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], 
				 [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], 
				 [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], 
				 [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], 
				 [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]]
			];
i = 0;j = 0;k = 0;
function test() {
	if (i === 2) {
		i = 0;
		k++;
		if (k === 4) {
			k = 0;
			j++;
			if (j === 15) {
				return;
			}
		}
	} else {
		console.log(array[i][j][k]);
		i++;
	}
//	console.log (i, j, k);
}