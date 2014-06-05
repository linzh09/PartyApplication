using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
using System.Text.RegularExpressions;

namespace PartyApp.Models
{
    public partial class Party
    {

        public bool IsHostedBy(string userName)
        {
            return HostedBy.Equals(userName, StringComparison.InvariantCultureIgnoreCase);

        }

        public bool IsUserRegistered(string userName)
        {
            return Reservations.Any(r => r.Attender.Equals(userName, StringComparison.InvariantCultureIgnoreCase));
        }


        public bool IsValid
        {
            get { return (GetRuleViolations().Count() == 0); }
        }



        public IEnumerable<RuleViolation> GetRuleViolations()
        {
            if (String.IsNullOrEmpty(Title))
                yield return new RuleViolation("Title required", "Title");
            if (String.IsNullOrEmpty(Description))
                yield return new RuleViolation("Description required", "Description");
            if (String.IsNullOrEmpty(HostedBy))
                yield return new RuleViolation("HostedBy required", "HostedBy");
            if (String.IsNullOrEmpty(Address))
                yield return new RuleViolation("Address required", "Address");
            if (String.IsNullOrEmpty(Country))
                yield return new RuleViolation("Country required", "Country");
            if (String.IsNullOrEmpty(Contact))
                yield return new RuleViolation("Phone required", "ContactPhone");
            if (!PhoneValidator.IsValidNumber(Contact, Country))
                yield return new RuleViolation("Phone Number does not match country", "Contact");
            yield break;
        }
    }

        


    public class RuleViolation
    {

        public string ErrorMessage { get; private set; }
        public string PropertyName { get; private set; }

        public RuleViolation(string errorMessage, string propertyName)
        {
            ErrorMessage = errorMessage;
            PropertyName = propertyName;
        }
    }

    public class PhoneValidator
    {

        static IDictionary<string, Regex> countryRegex = new Dictionary<string, Regex>() 
           {
           { "USA", new Regex("^[2-9]\\d{2}-\\d{3}-\\d{4}$")},
           };



        public static bool IsValidNumber(string phoneNumber, string country)
        {
            if (country != null && countryRegex.ContainsKey(country))
                return countryRegex[country].IsMatch(phoneNumber);
            else
                return false;
        }


        public static IEnumerable<string> Countries
        {
            get
            {
                return countryRegex.Keys;
            }
        }
    }
}
