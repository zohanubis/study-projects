import axios from 'axios';
import { API_BASE_URL } from '../../config/apiConfig';

export const register = (userData) => async (dispatch) => {
    try {
        const response = await axios.post(`${API_BASE_URL}/auth/signup`, userData);
    } catch (error) {}
};
