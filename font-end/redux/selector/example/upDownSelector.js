/**
 * Copyright 2020 present, Lê Văn Mong.
 * All rights reserved.
 *  on 06/01/2021
 * @email: levanmong.dola.99@gmail.com
 * @student_code: 68DCHT20091
 * @university: FBU ( đại học tài chính ngân hàng hà nội)
 */
import { createSelector } from 'reselect';
const Counts = (state) => state.Counts;
export const upDownSelector = createSelector([Counts], (counts) => counts);
