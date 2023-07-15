const OrderModel = require('./../models/order_model');
const CartModel = require('./../models/cart_model');


const OrderController = {
  createOrder: async function (req, res) {
    try {
      const { user, items, pickupDate, pickupTimeSlot, pickupAddress, pickupPhoneNumber, pickupPincode } = req.body;

      const newOrder = new OrderModel({
        user: user,
        items: items,
        pickupDate: new Date(pickupDate), // Parse the provided date and assign it to pickupDate
        pickupTimeSlot: pickupTimeSlot,
        pickupAddress: pickupAddress,
        pickupPhoneNumber: pickupPhoneNumber,
        pickupPincode: pickupPincode
      });
      await newOrder.save();

      // Update the cart
      await CartModel.findOneAndUpdate(
        { user: user._id },
        { items: [] }
      );

      return res.json({ success: true, data: newOrder, message: "Order created!" });
    } catch (ex) {
      return res.json({ success: false, message: ex });
    }
  },

  fetchOrdersForUser: async function(req, res) {
          try {
              const userId = req.params.userId;
              const foundOrders = await OrderModel.find({
                  "user._id": userId
              }).sort({ createdOn: -1 });
              return res.json({ success: true, data: foundOrders });
          }
          catch(ex) {
              return res.json({ success: false, message: ex });
          }
      },

      updateOrderStatus: async function(req, res) {
          try {
              const { orderId, status, razorPayPaymentId, razorPaySignature } = req.body;
              const updatedOrder = await OrderModel.findOneAndUpdate(
                  { _id: orderId },
                  { status: status,},
                  { new: true }
              );
              return res.json({ success: true, data: updatedOrder });
          }
          catch(ex) {
              return res.json({ success: false, message: ex });
          }
      }
};

module.exports = OrderController;
