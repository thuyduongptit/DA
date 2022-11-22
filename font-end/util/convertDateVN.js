

export default function convertDateVN(time_data) {
    try {
        const date_ob = new Date(time_data);

        // year as 4 digits (YYYY)
        const year = date_ob.getFullYear();

        // month as 2 digits (MM)
        const month = ('0' + (date_ob.getMonth() + 1)).slice(-2);

        // date as 2 digits (DD)
        const date = ('0' + date_ob.getDate()).slice(-2);

        // hours as 2 digits (hh)
        const hours = ('0' + date_ob.getHours()).slice(-2);

        // minutes as 2 digits (mm)
        const minutes = ('0' + date_ob.getMinutes()).slice(-2);

        // seconds as 2 digits (ss)
        const seconds = ('0' + date_ob.getSeconds()).slice(-2);

        return date + '-' + month + '-' + year + ', ' + hours + ':' + minutes + ':' + seconds;
    } catch (err) {
        console.log('err', err);
    }
}
