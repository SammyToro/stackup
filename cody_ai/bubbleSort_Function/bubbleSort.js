let array = [5,3,6,2,10,1,9,4];

//Implement a bubble sort function
function bubbleSort(arr){
    for(let i = 0; i < arr.length; i++){
      for(let j = 0; j < arr.length - i - 1; j++){
        if(arr[j] > arr[j+1]){
          let temp = arr[j];
          arr[j] = arr[j+1];
          arr[j+1] = temp;
        }
      }
    }
    console.log(arr);
    return arr;
  }

  bubbleSort(array);
