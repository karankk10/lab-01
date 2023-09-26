// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

    library ArrayUtils {
        event ArraySorted(uint[] sortedArray);
        event Removed(uint[] uniqueArray);

        function arraySort(uint[] storage data) internal {
            uint length = data.length;
            for (uint i = 0; i < length - 1; i++) {
                for (uint j = 0; j < length - i - 1; j++) {
                    if (data[j] > data[j + 1]) {
                        (data[j], data[j + 1]) = (data[j + 1], data[j]);
                }
            }
        }
        emit ArraySorted(data);
    }

    function arrayRmvDuplicates(uint[] storage data) internal {
        uint length = data.length;
        if (length <= 1) {
            return;
        }
        uint tail = 1;
        for (uint i = 1; i < length; i++) {
            bool isDuplicate = false;
            for (uint j = 0; j < tail; j++) {
                if (data[i] == data[j]) {
                    isDuplicate = true;
                    break;
                }
            }
            if (!isDuplicate) {
                data[tail] = data[i];
                tail++;
            }
        }
        while (data.length > tail) {
            data.pop();
        }
        emit Removed(data);
    }
}

    contract ResultArray {
        using ArrayUtils for uint[];
        uint[] public myArray;

    constructor(){
        myArray=[212,932,22,33,22,33,22,333,113,212,32,233,23];
    }

    function addValue(uint _value) public {
        myArray.push(_value);
    }

    function sort() public {
        myArray.arraySort();
    }

    function removeDuplicate() public {
        myArray.arrayRmvDuplicates();
    }

    function sortingAndDuplicateTermination() public {
        myArray.arraySort();
        myArray.arrayRmvDuplicates();
    }
    
    function getMyArray() public view returns (uint[] memory) {
        return myArray;
    }
}