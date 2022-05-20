/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 10/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */

function MergeArr(arr1, arr2) {
    let objArr1 = {};
    let objArr2 = {};
    arr1.map((item) => (objArr1[item.id] = item));
    arr2.map((item) => (objArr2[item.id] = item));
    const obj = { ...objArr1, ...objArr2 };
    return [...Object.values(obj)];
}

export default MergeArr;
