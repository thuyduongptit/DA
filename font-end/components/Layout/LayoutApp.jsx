/**
 * Copyright 2020 present, Đào Thị Thanh Mai.
 * All rights reserved.
 *  on 02/10/2021

 * @university: FBU ( đại học tài chính ngân hàng hà nội)
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
