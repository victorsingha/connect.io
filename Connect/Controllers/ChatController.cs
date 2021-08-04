using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Connect.Controllers
{
    public class ChatController : Controller
    {
        // Chat/{{ActionName}}

        // API for Connect Button
        [HttpPost]
        public ActionResult Connect(string IP1,string IP2,string Port1,string Port2)
        {
            try 
            {
                return Json(new { success = true, responseText = "Connected." }, JsonRequestBehavior.AllowGet);
            }
            catch(Exception e)
            {
                return Json(new { success = false, responseText = e.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        //API for Send Button
        [HttpPost]
        public ActionResult Send(string message)
        {
            try
            {
                return Json(new { success = true, responseText = message }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(new { success = false, responseText = e.Message }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}