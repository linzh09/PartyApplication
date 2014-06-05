using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace PartyApp.Models
{
    public class PartyRepository
    {
        private PartyDataContext db = new PartyDataContext();


        //
        // Query Methods
        public IQueryable<Party> FindAllParties()
        {
            return db.Parties;
        }

        public IQueryable<Party> FindUpcomingParties()
        {
            return from party in db.Parties
                   where party.PartyDate > DateTime.Now
                   orderby party.PartyDate
                   select party;
        }

        public Party GetParty(int id)
        {
            return db.Parties.SingleOrDefault(d => d.PartyID == id);
        }

        public void Add(Party party)
        {
            db.Parties.InsertOnSubmit(party);
        }

        public void Delete(Party party)
        {
            foreach (Reservation res in party.Reservations.ToList())
                db.Reservations.DeleteAllOnSubmit(party.Reservations);
            db.Parties.DeleteOnSubmit(party);
        }

        public void Save()
        {
            db.SubmitChanges();
        }
    }
}