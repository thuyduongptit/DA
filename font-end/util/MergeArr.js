

function MergeArr(arr1, arr2) {
    let objArr1 = {};
    let objArr2 = {};
    arr1.map((item) => (objArr1[item.id] = item));
    arr2.map((item) => (objArr2[item.id] = item));
    const obj = { ...objArr1, ...objArr2 };
    return [...Object.values(obj)];
}

export default MergeArr;
