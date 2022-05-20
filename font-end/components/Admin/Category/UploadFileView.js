/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 29/04/2021
 * @email: levanmong.dola.99@gmail.com
 * @phone: +84373668113
 * @slogan: "Mọi thứ đều bắt đầu từ việc nhỏ, những khát vọng phải lớn"
 */

import React, { forwardRef, useImperativeHandle } from 'react';
import { Upload, message } from 'antd';
import PropTypes from 'prop-types';

// styles
import _styles from './styles/index.module.scss';
import { url_base, url_base_img } from '../../../util/TypeUI';

// const
const getBase64 = (file) => {
    return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => resolve(reader.result);
        reader.onerror = (error) => reject(error);
    });
};

const UploadFileView = forwardRef((props, ref) => {
    const {
        refFunc,
        Img,
        styles,
        imgDefault,
        callback = () => {},
        fileListUtil,
        linkFileUtil,
        setLinkFileUtil,
        setFileListUtil,
		accept
    } = props;
    const [linkFile, setLinkFile] = React.useState('');
    const [fileList, setFileList] = React.useState([]);

    const linkFileView = linkFile ? url_base_img + 'file/' + linkFile : imgDefault;

    // handle func
	function beforeUpload(file) {
		console.log('file.type', file.type); // MongLV log fix bug
		if(Array.isArray(accept) && accept.length >=2) {
			const isJpgOrPng = file.type === accept[0] || file.type === accept[1];
			if (!isJpgOrPng) {
				message.error('You can only upload JPG/PNG file!');
			}
			// const isLt2M = file.size / 1024 / 1024 < 2;
			// if (!isLt2M) {
			// 	message.error('Image must smaller than 2MB!');
			// }
			// return isJpgOrPng && isLt2M;
			return isJpgOrPng;
		}
		return true;
	}
    const onChange = (info) => {
        setFileList(info.fileList);
        setFileListUtil(info.fileList);
        switch (info.file.status) {
            case 'uploading':
                break;
            case 'done':
                // message.success('Thêm thành công');
                setLinkFile(info.file.response.fileNameInServer);
                setLinkFileUtil(info.file.response.fileNameInServer);
                break;
            default:
                // message.error(`${info.file.name}`);
                setLinkFile('');
                setLinkFileUtil('');
                break;
        }
    };

    // Props
    const UpFile = {
        name: 'file',
        action: `${url_base}/file/upload`,
        multiple: true,
        onChange: (info) => onChange(info),
    };

    useImperativeHandle(ref, () => ({
        linkFile,
        setLinkFile,
        setFileList,
    }));

    React.useEffect(() => {
        linkFile && callback(linkFile);
    }, [linkFile, fileList]);

    React.useEffect(() => {
        setFileList(fileListUtil);
        setLinkFile(linkFileUtil);
    }, [fileListUtil, linkFileUtil]);

    return (
        <div className={styles.upload_file}>
            <Upload {...UpFile} fileList={fileList} listType='picture-card' beforeUpload={beforeUpload} accept={accept.toString()}>
                {linkFile.length <= 0 ? (
                    <img alt='example' src={linkFileView} style={{ width: Img.width, height: Img.height }} />
                ) : null}
            </Upload>
        </div>
    );
});
UploadFileView.propTypes = {
    refFunc: PropTypes.object,
    styles: PropTypes.object,
    Img: PropTypes.string,
    imgDefault: PropTypes.string,
    callback: PropTypes.func,
    setLinkFileUtil: PropTypes.func,
    setFileListUtil: PropTypes.func,
    linkFileUtil: PropTypes.string,
    fileListUtil: PropTypes.array,
    // refFunc, Img, styles, imgDefault, callback = () => {}
	accept: PropTypes.array,
};

UploadFileView.defaultProps = {
    Img: { width: 50, height: 50 },
    refFunc: { current: null },
    styles: _styles,
    imgDefault: 'https://img.icons8.com/cotton/344/image--v1.png',
    setLinkFileUtil: () => {},
    setFileListUtil: () => {},
    linkFileUtil: '',
    fileListUtil: [],
	// accept: ['image/png', 'image/jpeg'],
	// accept: ['video/mp4', 'video/mp4'],
	accept: [],
};
export default React.memo(UploadFileView);
