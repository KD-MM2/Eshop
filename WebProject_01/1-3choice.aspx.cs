using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebProject_01
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            SqlDataSource_order_detail.SelectParameters["order_no"].DefaultValue = order_no.ToString();
            SqlDataSource_order_detail.SelectParameters["item_id"].DefaultValue = e.CommandArgument.ToString();
            DataView dataview = (DataView)SqlDataSource_order_detail.Select(args);
            if (dataview.Table.Rows.Count > 0)
            {
                SqlDataSource_order_detail.Update();
            }
            else
            {
                SqlDataSource_order_detail.InsertParameters["item_id"].DefaultValue = e.CommandArgument.ToString();
                SqlDataSource_order_detail.Insert();

            }
        }

        protected int GetNew_order_no()
        {
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView dataview = (DataView)SqlDataSource_order.Select(args);
            int order_no = 1;
            if(dataview.Table.Rows[0].ItemArray.GetValue(0) != DBNull.Value)
            {
                order_no = (Int32)dataview.Table.Rows[0].ItemArray.GetValue(0) + 1;
            }
            return order_no;
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int order_no = 0;
            if(Session["order_no"] == null)
            {
                order_no = GetNew_order_no();

                SqlDataSource_order.InsertParameters["order_no"].DefaultValue = order_no.ToString();
                SqlDataSource_order.InsertParameters["customer_id"].DefaultValue = "0";
                SqlDataSource_order.InsertParameters["date"].DefaultValue = DateTime.Now.ToString();
                SqlDataSource_order.InsertParameters["order_sts"].DefaultValue = "0";
                SqlDataSource_order.Insert();

                Session["order_no"] = order_no;

            } else
            {
                order_no = (int)Session["order_no"];

            }
        }
    }
}