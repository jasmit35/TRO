from dataclasses import dataclass
from logging import getLogger
import os
import sys
from function_logger import function_logger

tro_code_path = os.path.abspath("../tro/local/python")
sys.path.insert(1, tro_code_path)
from category_data import CategoryData


class CategoriesTable:
    _db_conn = None
    _logger = getLogger()

    def __init__(self, db_conn):
        self._logger.info(f"Begin 'CategoriesTable.__init__' arguments - {db_conn}")

        self._db_conn = db_conn

        self._logger.info(f"End   'CategoriesTable.__init__' returns - None")
        return None

    def __str__(self) -> str:
        return "CategoriesTable"

    # ---------------------------------------------------------------------------------------------------------------------
    @function_logger
    def select_id_using_name(self, cat_name):
        category_id = None
        sql = """
            select category_id
            from tro.categories
            where category_name = %s
        """
        with self._db_conn.cursor() as cursor:
            cursor.execute(sql, (cat_name,))
            results = cursor.fetchone()
            if results is not None:
                category_id = results[0]

        return category_id

    # ---------------------------------------------------------------------------------------------------------------------
    @function_logger
    def insert(self, category_data):
        sql = """
            insert into tro.categories
            (category_name, category_type_fk, category_group_fk)
            values (%s, %s, %s)
        """
        with self._db_conn.cursor() as cursor:
            rc = cursor.execute(
                sql,
                (
                    category_data.category_name,
                    category_data.category_type_fk,
                    category_data.category_group_fk,
                ),
            )
        new_id = self.select_id_using_name(category_data.category_name)
        return new_id

    # ---------------------------------------------------------------------------------------------------------------------
    @function_logger
    def update(self, new_row):
        sql = """
            select * from tro.categories
            where category_id = %s
       """
        existing_row = None
        with self._db_conn.cursor() as cursor:
            cursor.execute(sql, (new_row.category_id,))
            existing_row = CategoryData(cursor.fetchone())
            self._logger.debug(f"     {existing_row=}")

        perform_update = False
        if existing_row.category_name != new_row.category_name:
            perform_update = True
            self.report("    changing '{existing_row.category_name}' to '{new_row.category_name}'")

        if existing_row.category_type_fk != new_row.category_type_fk:
            perform_update = True
            self._logger.info("    changing '{existing_row.category_type_fk}' to '{new_row.category_type_fk}'")

        if existing_row.category_group_fk != new_row.category_group_fk:
            perform_update = True
            self._logger.info("    changing '{existing_row.category_group_fk}' to '{new_row.category_group_fk}'")

        if perform_update:
            sql = """
                update tro.categories
                    set category_name = %s,
                        category_type_fk = %s,
                        category_group_fk = %s
                where category_id = %s
             """
            with self._db_conn.cursor() as cursor:
                cursor.execute(
                    sql,
                    (
                        new_row.category_name,
                        new_row.category_type_fk,
                        new_row.category_group_fk,
                        new_row.category_id,
                    ),
                )

        return perform_update

    # ---------------------------------------------------------------------------------------------------------------------
    @function_logger
    def delete_by_id(self, category_id):
        sql = """
            delete from tro.categories
            where category_id = %s
        """
        with self._db_conn.cursor() as cursor:
            cursor.execute(sql, (category_id,))
            rows_deleted = cursor.rowcount

            if rows_deleted == 1:
                return True
            else:
                return False

    # ---------------------------------------------------------------------------------------------------------------------
    @function_logger
    def truncate(self):
        sql = """
            truncate tro.categories;
            select setval('tro.categories_category_id_seq', 1);
        """
        self._logger.debug(f"    {self._db_conn=}")
        with self._db_conn.cursor() as cursor:
            cursor.execute(sql)

    # ---------------------------------------------------------------------------------------------------------------------
    @function_logger
    def get_row_count(self):
        sql = """
            select count(*) from tro.categories;
        """
        with self._db_conn.cursor() as cursor:
            cursor.execute(sql)
            row_count = cursor.fetchone()[0]

        return row_count
