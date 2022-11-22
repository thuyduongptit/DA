

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
