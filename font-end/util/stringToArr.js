/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 13/05/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */

const stringToArr = (arr, type) => {
    if (type) {
        const new_arr = arr.map((item) => {
            item[type] = JSON.parse(item[type]);
            return item;
        });

        return new_arr;
    } else return arr;
};
export default stringToArr;
