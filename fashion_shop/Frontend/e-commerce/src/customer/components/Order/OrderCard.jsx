import { Grid } from '@mui/material';
import React from 'react';
import AdjustIcon from '@mui/icons-material/Adjust';
import { useNavigate } from 'react-router-dom';
const OrderCard = () => {
    const navigate = useNavigate();

    return (
        <div
            onClick={() => navigate(`/account/order/${5}`)}
            className="p-5 shadow-md shadow-black hover:shadow-2xl border"
        >
            <Grid container spacing={2} sx={{ justifyContent: 'space-between' }}>
                <Grid item xs={6}>
                    <div className="flex cursor-pointer">
                        <img
                            className="w-[5rem] h-[5rem] object-cover object-top"
                            src="https://cdn2.yame.vn/pimg/ao-thun-co-tron-the-thao-m36-0021079/d40cedd1-b83d-2200-dec1-00194cad80b6.jpg?w=540&h=756"
                            alt=""
                        />
                        <div className="ml-5 space-y-2">
                            <p className="">
                                Áo Thun Cổ Tròn Tay Ngắn Sợi Nhân Tạo Thoáng Mát Phối Màu Dáng Ôm Đơn Giản Gu Đơn Giản
                                M36
                            </p>
                            <p className="opacity-50 text-xs font-semibold">Size:M</p>
                            <p className="opacity-50 text-xs font-semibold">Color: Red</p>
                        </div>
                    </div>
                </Grid>
                <Grid item xs={2}>
                    <p>$20</p>
                </Grid>
                <Grid item xs={4}>
                    {true && (
                        <div>
                            <p>
                                <AdjustIcon
                                    sx={{ width: '15px', height: '15px' }}
                                    className="text-green-600 mr-2 text-sm"
                                />
                                <span>Delivery On Mar 03</span>
                            </p>
                            <p className="text-xs">Your Item Has Been Delivered</p>
                        </div>
                    )}
                    {false && (
                        <p>
                            <span>Expected Delivery On Mar 03</span>
                        </p>
                    )}
                </Grid>
            </Grid>
        </div>
    );
};

export default OrderCard;
