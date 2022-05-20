function convertArrayToItems(array = []) {
    let items = {};
    try {
        array.map((item) => {
            if (item.id) {
                item.id = item.id.toString(); // Chuyển id sang dạng string để dễ đồng bộ với client
                items[item.id] = item;
            }
        });
    } catch (e) {}
    return items;
}
module.exports = convertArrayToItems;
