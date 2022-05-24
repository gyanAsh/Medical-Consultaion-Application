import React, { useState,useEffect } from 'react';
import { Typography, Card, Button, FormControl, TextField, FormHelperText } from '@material-ui/core'
import {Rating} from '@material-ui/lab'

const RateAppointment = ({ appointmentInfo,loggedInToken,closeModalRating }) => {
    
    const [comment, setComment] = useState();
    const [rating, setRating] = useState(null);
    const [ratingErr, setRatingErr] = useState(false);
    const [ratingErrMsg, setRatingErrMsg] = useState("");
    
    useEffect(() => {
        setRatingErrMsg("");
        setRatingErr(false);
    },[rating])

    const handleCommentChange = (e) => {
        setComment(e.target.value);
    }

    const handleSubmit=(e)=>{
        e.preventDefault();

        if (rating == null) {
            setRatingErr(true);
            setRatingErrMsg("Submit a rating");
        return;
        }

        const ratingData = {
            "appointmentId":appointmentInfo.appointmentId,
            "doctorId":appointmentInfo.doctorId,
            "rating":rating,
            "comments":comment
        }

        fetch(`http://localhost:8080/ratings`,{
            method:'POST',
            headers: {
                "Content-Type": "application/json",
                'Authorization': `Bearer ${loggedInToken}`
            },
            body:JSON.stringify(ratingData)
        }).then(res => {
            if (res.status !== 200) {
                throw new Error("Unable to Submit the rating");
            }
            closeModalRating();
            console.log("Rating submitted");
        }).catch(err=>console.log(err.message));
    }

    return (
        <Card style={{ width: 650}}>
        <Typography style={{height:70, backgroundColor: "purple", color: "white", padding: "11px",display: "flex",alignItems: "center"}} variant="h5">Rate an Appointment</Typography>
        <form onSubmit={handleSubmit} style={{ padding: 20, display: 'flex', flexDirection: 'column',alignItems: 'left', gap: 20}}>
            <FormControl  required="true" variant="standard">
                <TextField
                    id="standard-multiline-static"
                    label="Comments"
                    value={comment}
                    multiline
                    rows={4}
                    style={{ width: 300 }}
                    onChange={handleCommentChange}
                />
            </FormControl>
                <FormControl required="true" variant="standard">
                    <Typography variant="h6">Rating:
            <Rating
                name="simple-controlled"
                value={rating}
                onChange={(event, newValue) => {
                    setRating(newValue);
                }}
                        />
                         </Typography>
                <FormHelperText error={ratingErr}>{ratingErrMsg}</FormHelperText>
            </FormControl>
            <Button
            variant="contained"
            color="primary"
            type="submit"
            style={{width:250}}>RATE APPOINTMENT</Button>
            </form>
        </Card>
    )
}

export default RateAppointment;