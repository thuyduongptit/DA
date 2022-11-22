

import axiosClient from './axiosClient';
const url_base = '/category';
const categoryAPI = {
    // params yeu cau sau / vd : lay ra 10 ptu dau
    getAll(data) {
        return axiosClient.get(url_base, data);
    },
    // get(id) {
    //     const url = `/product/${id}`;
    //     return axiosClient.get(url);
    // },
    add(data) {
        return axiosClient.post(url_base, data);
    },
    update(data) {
        return axiosClient.put(url_base, data);
    },
    delete(id) {
        const url = `${url_base}/${id}`;
        return axiosClient.delete(url);
    },
};
export default categoryAPI;
