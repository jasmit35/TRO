from dataclasses import dataclass
from logging import getLogger

@dataclass
class CategoryData:
    category_id: int = 0
    category_name: str = ""
    category_type_fk: int = 0
    category_group_fk: int = 0
    category_description: str = ""
    category_hidden: bool = False

    _logger = getLogger()

    def __init__(self, category):
        self._logger.debug(f"Begin 'CategoriesData.__init__' arguments - {category}")

        # If category is a list, add 0 as the first element and convert it to a tuple
        if category.__class__.__name__ == "list":
            category = [0] + category
            category = tuple(category)

        cols = len(category)
        if cols > 0 and category[0] is not None:
            self.category_id = category[0]
        if cols > 1 and category[1] is not None:
            self.category_name = category[1]
        if cols > 2:
            self.category_type_fk = 0  # category[2]
        if cols > 3:
            self.category_group_fk = 0  # category[3]
        if cols > 4 and category[4] is not None:
            self.category_description = category[4]
        if cols > 5:
            self._category_hidden = category[5]

        self._logger.info(f"End   'CategoriesData.__init__' returns - {self}")
        return None

    def __str__(self) -> str:
        return f"CategoryData[{self.category_id}, '{self.category_name}', {self.category_type_fk}, \
{self.category_group_fk}, '{self.category_description}', {self._category_hidden}]"