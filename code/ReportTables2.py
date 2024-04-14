class Report:
    """
    
    A class used to represent a Report

    ...

    Attributes
    ----------
    report : dict
        a dictionary to store the tables and their titles for each sheet

    Methods
    -------
    add_to_report(sheet, table, table_title):
        Adds a table to the report under the specified sheet with the given title.
    write_report(writer, title_format):
        Writes all the tables in the report to an Excel file.
    write_sheet(list_of_dfs, table_titles, sheet_name, writer, title_format, include_sheet_name):
        Writes data from a list of dataframes to an Excel file using XlsxWriter.

        Made by: github.com/GoularteVinicius
    """
    import xlsxwriter
    import pandas as pd
    
    def __init__(self):
        """
        Constructs all the necessary attributes for the report object.

        Parameters
        ----------
            None
        """

        self.report = {}

    def add_to_report(self, sheet, table, table_title):
        """
        Adds a table to the report under the specified sheet with the given title.

        Parameters:
            sheet (str): The name of the sheet in the Excel file.
            table (DataFrame): A pandas dataframe to be added to the report.
            table_title (str): The title of the table.

        Returns:
            None
        """

        if sheet not in self.report:
            self.report[sheet] = {'table_titles': [], 'tables': []}
        self.report[sheet]['table_titles'].append(table_title)
        self.report[sheet]['tables'].append(table)

    def write_report(self, writer, title_format={'bold': True, 'font_size': 14}):
        """
        Writes all the tables in the report to an Excel file.

        Parameters:
            writer: An XlsxWriter object used to write to the Excel file.
            title_format (dict): A dictionary defining the format for the titles.

        Returns:
            None
        """

        for sheet_name, data in self.report.items():
            self.write_sheet(data['tables'], data['table_titles'], sheet_name, writer, title_format)

    def write_sheet(self, list_of_dfs, table_titles, sheet_name, writer, title_format, include_sheet_name=True):
        """
        Writes data from a list of dataframes to an Excel file using XlsxWriter.

        Parameters:
            list_of_dfs (list): A list of pandas dataframes to be written to the Excel file.
            table_titles (list): A list of titles for the tables.
            sheet_name (str): The name of the sheet in the Excel file.
            writer: An XlsxWriter object used to write to the Excel file.
            title_format (dict): A dictionary defining the format for the titles.
            include_sheet_name (bool): A flag indicating whether to include the sheet name in the title.

        Returns:
            None
        """

        title_format = writer.book.add_format(title_format)
        row_position = 2
        for title, table in zip(table_titles, list_of_dfs):
            table.to_excel(writer, sheet_name=sheet_name, startrow=row_position, startcol=2)
            title_text = f'{title} - {sheet_name}' if include_sheet_name else title
            writer.sheets[sheet_name].write(f'B{row_position-1}', title_text, title_format)
            row_position += (len(table) + table.columns.nlevels + 3)
            print(f'Write {title}')
        print('Finish Writing')
