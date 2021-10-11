/**
 * Copyright 2020 present, Đào Thị Thanh Mai.
 * All rights reserved.
 * @author Mongker on 02/10/2021
 * @email: monglv36@gmail.com
 * @student_code: 68DCHT20091
 * @university: UTT (Đại học Công Nghệ Giao Thông Vận Tải)
 */

import React from 'react';
import HeaderController from '../Header/HeaderController';
import Footer from '../Footer/Footer';
export default function LayoutApp({children  }) {
	return (
		<React.Fragment>
			<HeaderController />
			{children }
			<Footer />
		</React.Fragment>
	)
}
