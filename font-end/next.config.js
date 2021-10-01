/**
 * Copyright 2016-present, Bkav, Corp.
 * All rights reserved.
 *
 * This source code is licensed under the Bkav license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 * @author monglv@bkav.com on 01/10/2021
 *
 * History:
 * @modifier abc@bkav.com on xx/xx/xxxx đã chỉnh sửa abcxyx (Chỉ các thay đổi quan trọng mới cần ghi lại note này)
 */

'use strict';
/**
 * Copyright 2020 present,Lê Văn Mong.
 * All rights reserved.
 * @author Mongker on 01/09/2021
 * @email: monglv36@gmail.com
 * @student_code: 68DCHT20091
 * @university: UTT (Đại học Công Nghệ Giao Thông Vận Tải)
 */

/* eslint-disable */
const withAntdLess = require('next-plugin-antd-less');

module.exports = withAntdLess({
    lessVarsFilePath: './styles/antd-custom.less',
    cssLoaderOptions: {
        //   https://github.com/webpack-contrib/css-loader#object
        //
        //   sourceMap: true, // default false
        //   esModule: false, // default false
        //   modules: {
        //     exportLocalsConvention: 'asIs',
        //     exportOnlyLocals: true,
        //     mode: 'pure',
        //     getLocalIdent: [Function: getCssModuleLocalIdent]
        //   }
    },
    // Other Config Here...

    webpack(config) {
        return config;
    },
});
