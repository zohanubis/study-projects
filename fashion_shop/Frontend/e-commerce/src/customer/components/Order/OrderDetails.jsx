import React from 'react';
import AddressCard from '../AddressCard/AddressCard';
import OrderTraker from './OrderTraker';
import { Box, Grid } from '@mui/material';
import { deepPurple } from '@mui/material/colors';
import StarBorderIcon from '@mui/icons-material/StarBorder';

const OrderDetails = () => {
    return (
        <div className="px:5 lg:px-20">
            <div>
                <h1 className="font-bold text-xl py-7">Delivery Address</h1>
                <AddressCard />
            </div>
            <div className="py-20">
                <OrderTraker activeStep={3} />
            </div>
            <Grid className="space-y-5" container>
                {[1, 1, 1, 1, 1].map((item) => (
                    <Grid
                        item
                        container
                        className="shadow-xl rounded-md p-5 border"
                        sx={{ alignItems: 'center', justifyContent: 'space-between' }}
                    >
                        <Grid item xs={6}>
                            <div className="flex items-center space-x-4">
                                <img
                                    className="w-[5rem] h-[5rem] object-cover obeject-top"
                                    src="https://cdn2.yame.vn/pimg/ao-thun-co-tron-the-thao-m36-0021079/d40cedd1-b83d-2200-dec1-00194cad80b6.jpg?w=540&h=756"
                                    alt=""
                                />
                                <div className="space-y-2 ml-5">
                                    <p className="font-semibold">
                                        Áo Thun Cổ Tròn Tay Ngắn Sợi Nhân Tạo Thoáng Mát Phối Màu Dáng Ôm Đơn Giản Gu
                                        Đơn Giản M36
                                    </p>
                                    <p className="space-x-5 opacity-50 text-xs font-semibold">
                                        <span>Color : Red</span> <span>Size: M</span>
                                    </p>
                                    <p>Seller: Shirt</p>
                                    <p>$20</p>
                                </div>
                            </div>
                        </Grid>
                        <Grid item>
                            <Box sx={{ color: deepPurple[500] }}>
                                <StarBorderIcon sx={{ fontSize: '2rem' }} className="px-2 " />
                                <span>Rate & Review Product</span>
                            </Box>
                        </Grid>
                    </Grid>
                ))}
            </Grid>
        </div>
    );
};

export default OrderDetails;
