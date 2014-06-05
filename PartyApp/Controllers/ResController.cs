using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PartyApp.Models;

namespace PartyApp.Controllers
{
    public class ResController : Controller
    {
        PartyRepository partyRepository = new PartyRepository();
        //
        // AJAX: /Parties/Reservation ForParty
        [Authorize, AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Register(int id)
        {
            Party party = partyRepository.GetParty(id);
            if (!party.IsUserRegistered(User.Identity.Name))
            {
                Reservation res = new Reservation();
                res.Attender = User.Identity.Name;

                party.Reservations.Add(res);
                partyRepository.Save();
            }
            return Content("Thanks!");
        }


    }
}
