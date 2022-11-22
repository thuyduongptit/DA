function convertArrayToItems(array = []) {
    let items = {};
    try {
        array.map((item) => {
            if (item.id) {
                item.id = item.id.toString(); 
                items[item.id] = item;
            }
        });
    } catch (e) {}
    return items;
}
module.exports = convertArrayToItems;
