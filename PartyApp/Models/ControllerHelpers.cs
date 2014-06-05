using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PartyApp.Models
{
    public static class ControllerHelpers
    {
        public static void AddRuleViolations(this ModelStateDictionary modelState, IEnumerable<RuleViolation> errors)
        {
            foreach (RuleViolation issue in errors)
            {
                modelState.AddModelError(issue.PropertyName, issue.ErrorMessage);
            }
        }


    }
}