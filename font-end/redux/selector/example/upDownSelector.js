
import { createSelector } from 'reselect';
const Counts = (state) => state.Counts;
export const upDownSelector = createSelector([Counts], (counts) => counts);
