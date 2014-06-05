using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PartyApp.Models;

namespace PartyApp.Controllers
{
    public class PartiesController : Controller
    {
        PartyRepository partyRepository = new PartyRepository();

        //
        // GET: /Parties/

        public ActionResult Index()
        {
            var parties = partyRepository.FindAllParties().ToList();
            return View(parties);
        }
        //
        //Get:/Parties/Details
        public ActionResult Details(int id)
        {
            Party party = partyRepository.GetParty(id);
            if (party == null)
                return View("NotFound");
            else
                return View(party);
        }
        //
        // GET: /Dinners/Edit/
        public ActionResult Edit(int id)
        {
            Party party = partyRepository.GetParty(id);           
            return View(party);
        }

        //
        // POST: /Dinners/Edit/
        [AcceptVerbs(HttpVerbs.Post), Authorize]
        public ActionResult Edit(int id, FormCollection formValues)
        {
            Party party = partyRepository.GetParty(id);
            if (!party.IsHostedBy(User.Identity.Name))
                return View("Invalid");

            try
            {
                UpdateModel(party);
                partyRepository.Save();
                return RedirectToAction("Details", new { id = party.PartyID });
            }
            catch
            {
                
                ModelState.AddRuleViolations(party.GetRuleViolations());
               
                
                return View(party);
            }
        }

        //
        //GET: /Dinners/Create

        [Authorize]
        public ActionResult Create()
        {
            Party party = new Party()
            {
                PartyDate = DateTime.Now.AddDays(7)
            };
            return View(party);
        }

        // POST: /Dinners/Create
        [HttpPost, Authorize]
        public ActionResult Create(Party party)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    party.HostedBy = User.Identity.Name;
                    Reservation res = new Reservation();
                    res.Attender = User.Identity.Name;
                    party.Reservations.Add(res);                      


                    partyRepository.Add(party);
                    partyRepository.Save();
                    return RedirectToAction("Details", new { id = party.PartyID });
                }
                catch
                {
                    ModelState.AddRuleViolations(party.GetRuleViolations());
                }
            }
            return View(party);
        }

        //
        //HTTP GET: /Dinners/Delete/
        public ActionResult Delete(int id)
        {
            Party party = partyRepository.GetParty(id);
            if (!party.IsHostedBy(User.Identity.Name))
                return View("Invalid");

            if (party == null)
                return View("NotFound");
            else
                return View(party);
        }
        //
        //HTTP POST: /Dinners/Delete
        [AcceptVerbs(HttpVerbs.Post), Authorize]
        public ActionResult Delete(int id, string confirmButton)
        {
            Party party = partyRepository.GetParty(id);
            if (party == null)
                return View("NotFound");
              partyRepository.Delete(party);
              partyRepository.Save();
              return View("Deleted");           

        }
    }
}
   
    

    


            

     
    

