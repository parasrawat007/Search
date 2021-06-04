using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Search.Models
{
    public class BankDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public BankDto()
        {

        }
        public BankDto(int Id,string Name)
        {
            this.Id = Id;
            this.Name = Name;
        }
    }
}