using Search.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Search.Controllers.Api
{
    public class BankController : ApiController
    {
        
        private SqlConnection Con;

        public BankController()
        {
        Con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
        }

        protected override void Dispose(bool disposing)
        {
            Con.Dispose();
        }

        [HttpPost]
        public IHttpActionResult Search(BankDto bank)
        {
            SqlCommand cmd = new SqlCommand("USP_Tbl_Bank", Con)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@Query", "Search");
            cmd.Parameters.AddWithValue("@Search", bank.Name);

            Con.Open();
            var rd=cmd.ExecuteReader();
            List<BankDto> Banks = new List<BankDto>();
            while(rd.Read())
            {
                Banks.Add(new BankDto(Convert.ToInt32(rd["Id"]),rd["Name"].ToString()));
            }
            Con.Close();
            return Ok(Banks);
        }
    }
}
