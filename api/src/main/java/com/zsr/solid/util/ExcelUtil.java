package com.zsr.solid.util;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;


public class ExcelUtil {

    /**
     * 导出Excel
     * @param sheetName sheet名称
     * @param title 标题
     * @param values 内容
     * @param wb HSSFWorkbook对象
     * @return
     */
    public static HSSFWorkbook getHSSFWorkbook(String sheetName,String []title,String [][]values, HSSFWorkbook wb){

        // 第一步，创建一个HSSFWorkbook，对应一个Excel文件
        if(wb == null){
            wb = new HSSFWorkbook();
        }

        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);

        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
        HSSFRow row = sheet.createRow(0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

        //声明列对象
        HSSFCell cell = null;

        //创建标题
        for(int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }

        //创建内容
        for(int i=0;i<values.length;i++){
            row = sheet.createRow(i + 1);
            for(int j=0;j<values[i].length;j++){
                //将内容按顺序赋给对应的列对象
                row.createCell(j).setCellValue(values[i][j]);
            }
        }
        return wb;
    }

    public static HSSFWorkbook getOrderWorkbook(String sheetName,String []title,String [][]values, HSSFWorkbook wb){

        if(wb == null){
            wb = new HSSFWorkbook();
        }

        //创建一个sheet对象
        HSSFSheet sheet = wb.createSheet(sheetName);

        //设置表头居中样式
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        //设置合并单元格
        HSSFRow firstRow = sheet.createRow(0);
        HSSFCell firstCell = null;
        //创建标题
        for(int i=0;i<title.length;i++){
            firstCell = firstRow.createCell(i);
            firstCell.setCellStyle(style);
            firstCell.setCellValue("收购明细");
            if(i<11){
                firstCell.setCellValue("采购明细");
            }
        }
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,10));
        sheet.addMergedRegion(new CellRangeAddress(0,0,11,title.length-1));

        //设置正文
        HSSFRow row = sheet.createRow(1);

        //声明列对象
        HSSFCell cell = null;

        //创建标题
        for(int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }

        //创建内容
        for(int i=0;i<values.length;i++){
            row = sheet.createRow(i + 2);
            for(int j=0;j<values[i].length;j++){
                //将内容按顺序赋给对应的列对象
                row.createCell(j).setCellValue(values[i][j]);
            }
        }
        return wb;
    }

    public static HSSFWorkbook getCalculationWorkbook(String sheetName,String []title,String [][]values, HSSFWorkbook wb){

        // 第一步，创建一个HSSFWorkbook，对应一个Excel文件
        if(wb == null){
            wb = new HSSFWorkbook();
        }

        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);

        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
        HSSFRow row = sheet.createRow(0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

        //声明列对象
        HSSFCell cell = null;

        //创建标题
        for(int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }

        //创建内容
        for(int i=0;i<values.length;i++){
            row = sheet.createRow(i + 1);
            for(int j=0;j<values[i].length;j++){
                HSSFCell contentCell = row.createCell(j);
                //将内容按顺序赋给对应的列对象
                contentCell.setCellStyle(style);
                contentCell.setCellValue(values[i][j]);
            }
        }

        Integer rowIndexList[] = {0,12,13,14};

        for(Integer rowIndex:rowIndexList){
            String content ="";
            int merge = 0;
            for(int i=0;i<values.length;i++){
                if(content.equals(values[i][rowIndex])){ //需要合并的列
                    merge++;
                }else{
                    sheet.addMergedRegion(new CellRangeAddress(i-merge,i,rowIndex,rowIndex));
                    content = values[i][rowIndex];
                    merge = 0;
                }
                if(i == values.length-1){
                    if(content.equals(values[i][rowIndex])){
                        sheet.addMergedRegion(new CellRangeAddress(i-merge+1,i+1,rowIndex,rowIndex));
                    }
                }
            }
        }

        return wb;
    }
}