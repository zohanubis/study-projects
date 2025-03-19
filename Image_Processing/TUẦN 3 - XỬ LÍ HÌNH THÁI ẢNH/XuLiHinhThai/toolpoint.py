import numpy as np
from ultralytics import YOLO
import cv2
import cvzone
import math
from sort import *

cap = cv2.VideoCapture("../Videos/CN-PN-NVT.mp4")  # Video

model = YOLO("../Yolo-Weights/yolov8n.pt")

classNames = ["motorcycles","bicycle", "car", "motorbike", "aeroplane", "bus", "train", "truck", "boat",
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
 #Tracking
tracker = Sort(max_age=20, min_hits=3, iou_threshold=0.5)
totalCount = []

limits = [320, 847, 1735, 834]
# Lấy kích thước của mặt nạ
mask_height, mask_width, _ = mask.shape

while True:
    success, img = cap.read()

    #Check read video : Success : Break
    if not success:
        break

    # Lấy kích thước của hình ảnh gốc
    height, width, _ = img.shape

    # Resize mặt nạ để phù hợp với kích thước của hình ảnh
    mask_resized = cv2.resize(mask, (width, height))

    # Thực hiện phép toán bitwise AND giữa hình ảnh và mặt nạ
    imgRegion = cv2.bitwise_and(img, mask_resized)

    results = model(imgRegion, stream=True)

    detections = np.empty((0, 5))

    for r in results:
        boxes = r.boxes
        for box in boxes:
            # Bouding box
            x1, y1, x2, y2 = box.xyxy[0]
            x1, y1, x2, y2 = int(x1), int(y1), int(x2), int(y2)
            w, h = x2 - x1, y2 - y1

            # Confidence
            conf = math.ceil((box.conf[0] * 100)) / 100
            cvzone.putTextRect(img, f'{conf}', (max(0, x1), max(35, y1)), scale=0.5)
            # Class Name
            cls = int(box.cls[0])
            currentClass = classNames[cls]

            #if (currentClass == "car"or currentClass == "truck"or currentClass == "bus"or currentClass == "motorbike" and conf > 0.3):
            if currentClass in ["car", "truck", "bus", "motorbike", "motorcycles"] and conf > 0.5:
                #Mảng chứa vị trí các đối tượng hiện tại kèm độ tin cậy Conf
                currentArray = np.array([x1, y1, x2, y2, conf])
                #Các nhận dạng sẽ được đưa vào ngăn xếp vstack
                detections = np.vstack((detections, currentArray))

    #Follow Tracker
    resultsTracker = tracker.update(detections)
    cv2.line(img, (limits[0],limits[1]), (limits[2], limits[3]), (0, 0, 255), 5)

    for result in resultsTracker:
        x1, y1, x2, y2, id = result
        x1, y1, x2, y2 = int(x1), int(y1), int(x2), int(y2)

        #print(result)
        w, h = x2 - x1, y2 - y1
        cvzone.cornerRect(img, (x1, y1, w, h), l=5, rt=2,colorR=(255,0,255))
        cvzone.putTextRect(img, f'{int(id)}', (max(0, x1), max(35, y1)),
                           scale=2, thickness=1, offset=3)

        cx, cy = x1+ w//2, y1+h//2
        cv2.circle(img,(cx,cy), 5,(255,0,255), cv2.FILLED)

        #Khi đi qua giới hạn sẽ được tính là 1
        if limits[0] < cx < limits[2] and limits[1] - 20 < cy < limits[1] + 20:
            if totalCount.count(id) == 0:
                totalCount.append(id)
                cv2.line(img, (limits[0],limits[1]), (limits[2], limits[3]), (0, 255, 0), 5)


    cvzone.putTextRect(img, f'Count :{len(totalCount)}', (50,50))

    cv2.imshow("Image", img)
    #cv2.imshow("ImageRegion", imgRegion)
    cv2.waitKey(5)
