import numpy as np
from ultralytics import YOLO
import cv2
import cvzone
import math
from sort import *
import tkinter as tk
from tkinter import filedialog

def select_video_file():
    root = tk.Tk()
    root.withdraw()
    file_path = filedialog.askopenfilename()
    return file_path

def detect_objects(img, model):
    results = model(img, stream=True)
    detections = np.empty((0, 5))

    for r in results:
        boxes = r.boxes
        for box in boxes:
            x1, y1, x2, y2 = map(int, box.xyxy[0])
            w, h = x2 - x1, y2 - y1
            conf = math.ceil((box.conf[0] * 100)) / 100
            currentClass = classNames[int(box.cls[0])]

            if currentClass in ["car", "truck", "bus", "motorbike", "motorcycles"] and conf > 0.3:
                currentArray = np.array([x1, y1, x2, y2, conf])
                detections = np.vstack((detections, currentArray))

    return detections

def draw_objects(img, detections, tracker, totalCount):
    resultsTracker = tracker.update(detections)
    cv2.line(img, (limits[0],limits[1]), (limits[2], limits[3]), (0, 0, 255), 5)


    for result in resultsTracker:
        x1, y1, x2, y2, id = map(int, result)
        w, h = x2 - x1, y2 - y1
        cvzone.cornerRect(img, (x1, y1, w, h), l=5, rt=2, colorR=(255,0,255))
        cvzone.putTextRect(img, f'{int(id)}', (max(0, x1), max(35, y1)), scale=2, thickness=1, offset=3)

        cx, cy = x1 + w // 2, y1 + h // 2
        cv2.circle(img,(cx, cy), 5, (255, 0, 255), cv2.FILLED)

        if limits[0] < cx < limits[2] and limits[1] - 20 < cy < limits[1] + 20:
            if totalCount.count(id) == 0:
                totalCount.append(id)
                cv2.line(img, (limits[0], limits[1]), (limits[2], limits[3]), (0, 255, 0), 5)

    cvzone.putTextRect(img,f"Count: {len(totalCount)}",(50,50),colorR=(0, 0, 0))
    return img

# Main code
video_path = select_video_file()

cap = cv2.VideoCapture(video_path)
frame_rate = cap.get(cv2.CAP_PROP_FPS)

model = YOLO("../Yolo-Weights/yolov8n.pt")
classNames = ["motorcycles", "bicycle", "car", "motorbike", "aeroplane", "bus", "train", "truck", "boat",
              "traffic light", "fire hydrant", "stop sign", "parking meter", "bench", "bird", "cat",
              "dog", "horse", "sheep", "cow", "elephant", "bear", "zebra",
              "giraffe", "backpack", "umbrella", "handbag",
              "tie", "suitcase", "frisbee", "skis", "snowboard", "sports ball", "kite",
              "baseball bat", "baseball glove", "skateboard", "surfboard", "tennis racket",
              "bottle", "wine glass", "cup", "fork", "knife", "spoon", "bowl", "banana",
              "apple", "sandwich", "orange", "broccoli", "carrot", "hot dog", "pizza",
              "donut", "cake", "chair", "sofa", "pottedplant", "bed", "diningtable",
              "toilet", "tvmonitor", "laptop", "mouse", "remote", "keyboard",
              "cell phone", "microwave", "oven", "toaster", "sink",
              "refrigerator", "book", "clock", "vase", "scissors", "teddy bear", "hair drier", "toothbrush"]


mask = cv2.imread("CN-HVT.png")
tracker = Sort(max_age=20, min_hits=3, iou_threshold=0.3)
totalCount = []
limits = [320, 847, 1735, 834]

while True:
    success, img = cap.read()

    if not success:
        break

    height, width, _ = img.shape
    mask_resized = cv2.resize(mask, (width, height))
    imgRegion = cv2.bitwise_and(img, mask_resized)

    detections = detect_objects(imgRegion, model)
    img = draw_objects(img, detections, tracker, totalCount)

    cv2.imshow("Image", img)

    # Tính toán thời gian delay giữa các khung hình
    delay_time = int(1000 / frame_rate)
    key = cv2.waitKey(delay_time)

    if key == 'x':
        break

