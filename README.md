# Optical_Flow_Based_on_Duality_Method
  The three elements of optical flow are as follows: optical flow produces velocity field; it is a carrier with information and optical properties such as pixels; it is a projection imaging of 3D scene motion to two-dimensional plane. It is the instantaneous velocity field generated by the motion of pixels with grayscale on the plane of the image.

Abstract:

Optical flow Model I: CLG Model + (grayscale Conservation hypothesis gradient Conservation hypothesis) + Non-Quadratic penalty = (u , v)

Optical flow Model II: CLG Model + (Grayscale Conservation hypothesis Laplacian Conservation hypothesis) + Non-Quadratic penalty = (u', v')

Final Optical flow: dual iteration (u , v) And (u', v')

Theoretical basis:

  The three elements of optical flow are as follows: optical flow produces velocity field; it is a carrier with information and optical properties such as pixels; it is a projection imaging of 3D scene motion to two-dimensional plane. It is the instantaneous velocity field generated by the motion of pixels with grayscale on the plane of the image.

  In 1981, Horn and Schunck [5] assumed that the time interval between the two frames was very small, that the brightness of a point in the image was proportional to the reflectivity of the surface of the corresponding point on the object, and that there was no spatial discontinuity in the smooth variation of reflectivity. A classical model of optical flow algorithm is proposed in the case of excluding the objects from blocking each other.
  
[1]Zach C, Pock T, Bischof H. A duality based approach for realtime TV-L1, optical flow[C]// Dagm Conference on Pattern Recognition. Springer-Verlag, 2007:214-223.

[2]Pock T, Urschler M, Zach C, et al. A Duality Based Algorithm for TV-L1-Optical-Flow Image Registration[J]. 2007.

[3]Chambolle A. An Algorithm for Total Variation Minimization and Applications[J]. Journal of Mathematical Imaging and Vision , 2009, 20(s1):89-97.

[4]Carter J L, Vandenberghe L, Osher S J, et al. Dual Methods for Total Variation-Based Image Restoration[J]. Dissertation Abstracts International, Volume: 61-12, Section: B, page: 6504.;Chair: Tony F. Chan. 2002.

[5]Horn B K P,Schunck B G. Determining optical flow[J]. Artificial Intelligence, 1981; 17: 185-204.

[6]Bruhn, A.: Variational Optic Flow Computation - Accurate Modelling and Efficient Numerics. Ph.D. thesis, University of Saarland (2006).

[7]Bruhn A, Weickert J, Schn, et al. Lucas/Kanade meets Horn/Schunck: combining local and global optic flow methods[J]. International Journal of Computer Vision, 2005, 61(3):211-231.

[8]Lucas B D, Kanade T. An iterative image registration technique with an application to stereo vision[C]// International Joint Conference on Artificial Intelligence. Morgan Kaufmann Publishers Inc. 1981:674-679.

[9]袁猛, 陈震, 危水根,等. 一种改进的变分光流计算方法[J]. 计算机工程, 2011, 37(3):215-217.

Yuan M,Chen Z,et al.Improved method for variational optic flow computation[J].Computer Engineering.2011,37(3):215-217.

[10]刘骏, 祖静, 张瑜,等. 光照变化条件下的光流估计[J]. 中国图象图形学报, 2014, 19(10):1475-1480.

Liu J, Zu J, Zhang Y, Zhang H Y. Optical flow estimation method under the condition of illumination change[J]. Jounal of Image and Graphics, 2014,19(10):1475-1480.

[10]高源. 基于变分光流场的运动目标检测算法研究[D]. 硕士论文，沈阳大学. 2016.

Gao Y. Research on moving object detection algorithm based on variational optical flow field[D]. Master’s thesis, Shenyang University, 2016.

[11]Papenberg N, Bruhn A, Brox T, et al. Highly Accurate Optic Flow Computation with Theoretically Justified Warping[J]. International Journal of Computer Vision, 2006, 67(2):141-158.

[12]Brox T, Bruhn A, Papenberg N, et al. High Accuracy Optical Flow Estimation Based on a Theory for Warping[J]. 2004, 3024(:10):25-36.

[13]Mahraz M A, Riffi J, Tairi H. High accuracy optical flow estimation based on PDE decomposition[J]. Signal, Image and Video Processing, 2015, 9(6):1-10.
