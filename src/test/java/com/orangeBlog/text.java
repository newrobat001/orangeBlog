package com.orangeBlog;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class text {

    @Test
    public  void textExcel() {
        try {
            // 1. 创建一个FileInputStream对象，指定文件路径
            FileInputStream fileInputStream = new FileInputStream("D:\\text.xls");

            // 2. 从输入流中获取一个工作簿对象
            XSSFWorkbook workbook = new XSSFWorkbook(fileInputStream);

            // 3. 从工作簿中获取一个工作表对象，这里假设是第一个工作表（索引为0）
            Sheet sheet = workbook.getSheetAt(0);

            // 4. 从工作表中获取目标行对象，这里假设是第一行（索引为0）
            Row row = sheet.getRow(0);

            // 5. 从目标行中获取单元格的值
            String cellValue1 = row.getCell(0).getStringCellValue();
            String cellValue2 = row.getCell(1).getStringCellValue();

            // 6. 打印读取到的值
            System.out.println("CellValue1: " + cellValue1);
            System.out.println("CellValue2: " + cellValue2);

            // 7. 关闭输入流
            fileInputStream.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
