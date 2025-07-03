#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <opencv2/opencv.hpp>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "live_camera_publisher");
    ros::NodeHandle nh;
    image_transport::ImageTransport it(nh);
    image_transport::Publisher pub = it.advertise("camera/image_raw", 1);

    cv::VideoCapture cap(0); // Gebruik camera device 0
    if(!cap.isOpened()) {
        ROS_ERROR("Kon camera niet openen");
        return 1;
    }

    ros::Rate loop_rate(30); // 30 FPS
    while (ros::ok()) {
        cv::Mat frame;
        cap >> frame;
        if (frame.empty()) continue;

        std_msgs::Header header;
        header.stamp = ros::Time::now();
        cv_bridge::CvImage image_msg(header, "bgr8", frame);

        pub.publish(image_msg.toImageMsg());
        ros::spinOnce();
        loop_rate.sleep();
    }

    return 0;
}
