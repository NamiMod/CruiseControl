/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003625333831_1474584815_init();
    work_m_00000000000992671407_3073477105_init();
    work_m_00000000003264507924_0319896249_init();
    work_m_00000000002144697785_4089762727_init();
    work_m_00000000000192851866_0886308060_init();
    work_m_00000000002009498367_2058220583_init();
    work_m_00000000002374107873_1283420335_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002374107873_1283420335");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
