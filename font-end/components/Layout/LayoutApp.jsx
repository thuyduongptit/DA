

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
